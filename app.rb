require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:homepage)
end

get("/dice/:num_dice/:size_die") do  #doesn't matter what is after the :, it is whatever the user inputs
  @num_dice = params.fetch("num_dice").to_i #params is built into sinatra to allow us to pull in input from the user
  @size_die = params.fetch("size_die").to_i

  @rolls = []

  @num_dice.times do
    die = rand(1..@size_die)

    @rolls.push(die)
  end

  erb(:flexible)
end
