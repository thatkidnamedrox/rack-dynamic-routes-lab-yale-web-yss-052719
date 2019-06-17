class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item = req.path.split("/items/").last
    else
      resp.write "Route not found"
      req.status = 404
    end
    resp.finish
  end
end
