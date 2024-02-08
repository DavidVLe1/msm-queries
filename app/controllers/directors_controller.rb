class DirectorsController < ApplicationController
  def index
    render(:template => "director_templates/list")
  end

  def show
    the_id=params.fetch("the_id")
    matching_records = Director.where({:id => the_id})
    @the_director=matching_records.at(0)
    render({:template => "director_templates/details"})
  end

  def show_youngest
    matching_directors=Director.all
    @youngest_director = matching_directors.order({:dob => :desc}).at(0)
    render(:template => "director_templates/youngest")
  end

  def show_eldest
    matching_directors=Director.all
    @eldest_director = matching_directors.order({:dob => :asc}).at(0)
    render(:template => "director_templates/eldest")
  end
end
