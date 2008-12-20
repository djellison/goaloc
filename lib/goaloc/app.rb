class App
  attr_accessor :name, :models, :routes, :options, :debug, :log

  def initialize(name = nil, options = { })
    self.name = (name or generate_name)
    self.options = options
    self.models = { }
    self.routes = []
    self.log = []
  end

  ROUTE_USAGE_STR = File.open("#{File.dirname(__FILE__)}/../../doc/route_usage").read
  
  def generate_name
    "goaloc_app" + Time.now.strftime("%Y%m%d%H%M%S")
  end
  
  def generate(generator = Rails, opts = { })
    if :all == generator
      Generator.subclasses.map { |g| g.constantize.new(self, opts.merge(:prefix => true)).generate }
    elsif Generator.subclasses.member?(generator.to_s)
      generator.new(self, opts).generate
    else
      raise "generator not implemented"
    end
  end

  def destroy
    Rails.new.destroy(self)
  end
  
  def add_attrs(h)
    h.map {  |k, v| k.to_s.singularize.camelize.constantize.add_attrs v rescue nil }
  end
  
  def destroy_model(klass) # TODO: make this also get rid of associations, etc.
    Object.send(:remove_const, klass.to_s.to_sym)
  end
  
  def route(*args)
    if valid_routeset?(args)
      self.routes += args
      args.each do |a|
        build_model(a, nil)
      end
    else
      puts ROUTE_USAGE_STR
    end
  end
  
  def valid_routeset?(arg) 
    arg.is_a?(Symbol) or
      valid_routeset_hash?(arg) or
      valid_routeset_array?(arg)
  end

  def valid_routeset_array?(arg)
    arg.is_a? Array and
      !arg.empty? and
      arg.all? { |x| valid_routeset?(x) }
  end

  def valid_routeset_hash?(arg)
    arg.is_a? Hash and
      arg[:class].is_a? Symbol
  end

  def build_model(arg, r)
    if arg.is_a? Symbol
      register_model!(arg, r)
    elsif arg.is_a? Array
      sym = arg.first
      model = (register_model!(sym, r))
      arg[1..-1].each do |a|
        m = build_model(a, (r.to_a.clone << model))
        model.has_many(m)
      end
      model
    elsif arg.is_a? Hash
      sym = arg[:class]
      model = register_model!(sym, r)
      thru = arg[:through]
      thru_model = register_model!(thru, r) if thru
      model.handle_hash(arg)
    end
  end

  def build_model_from_hash(m, h, r)
    if h.has_key?(:through)
      m.hmt(h)
    end
  end
  
  def register_model!(arg, r)
    self.models[arg] = Model.build_and_route(arg, r)
  end
end
