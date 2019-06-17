class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      item = Item.all.find_by(name: item_name)
      if item
        resp.write item.price
      else
        resp.write "Item not found"
        req.status = 400
      end
    else
      resp.write "Route not found"
      req.status = 404
    end
    resp.finish
  end
end
