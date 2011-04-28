require 'test_helper'

class <%= controller_class_name %>ControllerTest < ActionController::TestCase
  
  context "index action" do
    should "render index template" do
      get :index
      assert_template 'index'
    end
  end

  context "show action" do
    should "render show template" do
      get :show, :id => <%= class_name %>.first
      assert_template 'show'
    end
  end    
  
  context "new action" do
    should "render new template" do
      get :new
      assert_template 'new'
    end
  end

  context "create action" do
    should "render new template when model is invalid" do
      <%= class_name %>.any_instance.stubs(:valid?).returns(false)
      post :create
      assert_template 'new'
    end
    
    should "redirect when model is valid" do
      <%= class_name %>.any_instance.stubs(:valid?).returns(true)
      post :create
      assert_redirected_to
    end
  end

  context "edit action" do
    should "render edit template" do
      get :edit, :id => <%= class_name %>.first
      assert_template 'edit'
    end
  end

  context "update action" do
    should "render edit template when model is invalid" do
      <%= class_name %>.any_instance.stubs(:valid?).returns(false)
      put :update, :id => <%= class_name %>.first
      assert_template 'edit'
    end
  
    should "redirect when model is valid" do
      <%= class_name %>.any_instance.stubs(:valid?).returns(true)
      put :update, :id => <%= class_name %>.first
      assert_redirected_to
    end
  end

  context "destroy action" do
    should "destroy model and redirect to index action" do
      <%= singular_name %> = <%= class_name %>.first
      delete :destroy, :id => <%= singular_name %>
      assert_redirected_to
      assert !<%= class_name %>.exists?(<%= singular_name %>.id)
    end
  end
  
end
