class TagsController < ApplicationController

  # GET: /tags
  get "/tags" do
    erb :"/tags/index.html"
  end

  # GET: /tags/new
  get "/tags/new" do
    erb :"/tags/new.html"
  end

  # POST: /tags
  post "/tags" do
    redirect "/tags"
  end

  # GET: /tags/5
  get "/tags/:id" do
    erb :"/tags/show.html"
  end

  # GET: /tags/5/edit
  get "/tags/:id/edit" do
    erb :"/tags/edit.html"
  end

  # PATCH: /tags/5
  patch "/tags/:id" do
    redirect "/tags/:id"
  end

  # DELETE: /tags/5/delete
  delete "/tags/:id/delete" do
    redirect "/tags"
  end
end
