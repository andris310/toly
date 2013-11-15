require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products
  test 'product attributes must not be empty' do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image].any?
  end

  test 'product price must be positive' do
    product = Product.new(title: 'My Product',
                          description: 'some description',
                          image: 'some.jpg')
      product.price = -1
      assert product.invalid?
      assert_equal ['must be greater than or equal to 0.01'],
        product.errors[:price]

      product.price = 0
      assert product.invalid?
      assert_equal ['must be greater than or equal to 0.01'],
        product.errors[:price]

      product.price = 1
      assert product.valid?
  end

  def new_product(image)
    Product.new(title: 'My Product',
                description: 'some description',
                price: 1,
                image: image)
  end
  test 'image' do
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.jpg
              http://a.b.c/x/y/z/fred.gif }
    bad = %w{ fred.doc fred.gif/more fred.gif.more }
    ok.each do |name|
      assert new_product(name).valid?, "#{name} should be valid"
    end
    bad.each do |name|
      assert new_product(name).invalid?, "#{name} shouldn't be valid"
    end
  end

  test "product is not valid without a unique title - i18n" do
    product = Product.new(title: products(:ruby).title,
                          description: 'yyy',
                          price: 1,
                          image: 'fred.gif')
    assert product.invalid?
    assert_equal [I18n.translate('errors.messages.taken')],
                  product.errors[:title]
  end

end