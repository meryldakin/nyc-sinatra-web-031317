class FiguresController < ApplicationController

# Create

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create( params[:figure] )
    if !params[:title].empty?
      @figure.titles << Title.find_or_create_by( params[:title] )
    end
    if !params[:landmark].empty?
      @figure.landmarks << Landmark.find_or_create_by( params[:landmark] )
    end
    @figure.save
    redirect "/figures/#{@figure.id}"
  end


# Read
  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/:id' do
    @figure = Figure.find( params[:id] )
    erb :'/figures/show'
  end


# Edit
  get '/figures/:id/edit' do
    @figure = Figure.find( params[:id] )
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find( params[:id] )
    @figure.update(params[:figure])
    if !params[:title].empty?
      @figure.titles << Title.create(params[:title])
    end
    if !params[:landmark].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    @figure.save
    redirect "/figures/#{@figure.id}"
  end


end
