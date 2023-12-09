class ApplicationHelperTest < ActionView::TestCase
  test 'includes from Pagy::Frontend' do
    assert ApplicationHelper < Pagy::Frontend
  end
end