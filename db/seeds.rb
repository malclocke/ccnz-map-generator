defaults = {
  :paper_size => 'a4',
  :category_ids => [95, 97, 74, 69, 47, 73, 98, 99, 101, 88],
  :orientation => 'landscape',
  :include_index => true
}

[
  { :title => "Avonside, Dallington, Richmond", :top => -43.5266, :left => 172.6502, :bottom => -43.5045, :right => 172.6852 },
  { :title => "New Brighton, Bexley, North New Brighton", :top => -43.5256, :left => 172.6997, :bottom => -43.4853, :right => 172.7365 },
  { :title => "Southshore, South New Brighton", :top => -43.5631, :left => 172.7214, :bottom => -43.5082, :right => 172.7603 },
  { :title => "Brooklands, Spencerville", :top => -43.4412, :left => 172.6499, :bottom => -43.3891, :right => 172.7182 },
  { :title => "St Albans, Edgeware", :top => -43.5209, :left => 172.6157, :bottom => -43.4928, :right => 172.6517 },
  { :title => "Halswell", :top => -43.6292, :left => 172.5162, :bottom => -43.5618, :right => 172.6223 },
  { :title => "Avondale, Avonside, Linwood, Dallington, Wainoni, Aranui", :top => -43.5461, :left => 172.6505, :bottom => -43.5001, :right => 172.7152 },
  { :title => "Beckenham, Opawa, St Martins", :top => -43.5717, :left => 172.6333, :bottom => -43.5456, :right => 172.6789 },
  { :title => "Cashmere, Somerfield, Spreydon", :top => -43.6148, :left => 172.5947, :bottom => -43.5474, :right => 172.6522 },
  { :title => "Central City", :top => -43.5400, :left => 172.6123, :bottom => -43.5208, :right => 172.6510 },
  { :title => "Moncks Spur, Balmoral Hill, Mt Pleasant, St Andrews Hill", :top => -43.5853, :left => 172.7092, :bottom => -43.5513, :right => 172.7402 },
  { :title => "Moncks Bay, Clifton, Richmond Hill, Scarborough, Sumner", :top => -43.6100, :left => 172.7296, :bottom => -43.5610, :right => 172.8216 },
  { :title => "Lyttelton", :top => -43.6269, :left => 172.6442, :bottom => -43.5828, :right => 172.7598 }
].each do |params|
  Map.create! params.merge(defaults)
end
