class OrderForm
  include ActiveModel::Model
  # order_idは、保存されたタイミングで生成されるため、attr_accessorにおいて不要なカラムとなる（書くと蛇足なのでエラー）
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipalities, :address, :building_name, :phone_number, :token

  # 4行目と同じくこのタイミングでは生成前なので「validates :order_id」は不要
  with_options presence: true do
    # orderモデルのバリデーション
    validates :user_id
    validates :item_id
    # paymentモデルのバリデーション
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :municipalities
    validates :address
    validates :phone_number, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }
    # トークンのバリデーション
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    # ストロングパラメーターでデータが運ばれ、それらが保存のタイミングで「order_id」が生成され、保存される。
    @address = Address.create(order_id: order.id, post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address, building_name: building_name, phone_number: phone_number)
  end
end