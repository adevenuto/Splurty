require 'test_helper'

class QuotesControllerTest < ActionController::TestCase
  test "quote show page" do
    quote = FactoryGirl.create(:quote)
    get :show, :id => quote.id
    assert_response :success
  end
  test "quote show page, not found" do
    get :show, :id => 'OMG'
    assert_response :not_found
  end
  test "create a quote success" do
    quote = FactoryGirl.create(:quote)
    assert_difference 'Quote.count' do
      post :create, {:quote =>{
        :author => 'Gary Vaynerchuk',
        :saying => 'I love people, and the hustle.'
        }
      }
    end
    assert_redirected_to root_path
  end

  test "create a quote validation error"do

  end
end
