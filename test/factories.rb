Factory.define :map do |m|
  m.title 'Test Map'
  m.left 170.0
  m.right 171.0
  m.top -43.0
  m.bottom -44.0
end

Factory.define :category do |c|
  c.title 'Test Category Title'
  c.description 'Test Category Description'
  c.color '000000'
  c.icon 'http://localhost:3000/img/icon.png'
end

Factory.define :map_render do |mr|
  mr.association :map
end
