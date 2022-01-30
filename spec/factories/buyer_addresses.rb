FactoryBot.define do
  factory :buyer_address do
    post_code { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    block_number { '渋谷1-1' }
    building_name { '東京ハイツ' }
    telephone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
