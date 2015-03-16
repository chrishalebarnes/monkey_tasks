require 'rails_helper'

RSpec.describe TasksController, type: :controller do

  # Login before each test
  before(:each) do
    user = FactoryGirl.create(:user)
    request.session[:user_id] = user.id
  end

  describe "get tasks#index" do
    it "should render index template" do
      get :index
      expect(response).to be_success
      expect(response).to render_template(:index)
    end

    it "should assign @tasks with all tasks" do
      task1, task2 = FactoryGirl.create(:task), FactoryGirl.create(:task)
      get :index
      expect(assigns(:tasks)).to match_array([task1, task2])
    end
  end

  describe "post tasks#create" do
    it "should create task" do
      expect {
        post :create, task: FactoryGirl.attributes_for(:task)
      }.to change{Task.count}.by(1)
      expect(response).to redirect_to("/tasks")
    end
  end

  describe "put tasks#update" do
    it "should update task" do
      task = FactoryGirl.create(:task)
      put :update, id: task.id, task: { name: "Yak Already Shaved" }
      expect(Task.find(task.id).name).to eq("Yak Already Shaved")
    end
  end

  describe "delete tasks#destroy" do
    it "should delete task" do
      task = FactoryGirl.create(:task)
      expect {
        delete :destroy, id: task.id
      }.to change{Task.count}.by(-1)
    end
  end

  describe "puts tasks#complete" do
    it "should complete task" do
      task = FactoryGirl.create(:task)
      put :complete, task_id: task.id, task: task
      expect(Task.find(task.id).completed).to eq(true)
    end
  end
end