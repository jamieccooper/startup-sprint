require_relative 'config/environment'

class App < Sinatra::Base
  get '/' do
    @error = params['error']
    erb :home
  end

  get '/home' do
    redirect to('/')
  end

  get '/rainbow' do
    erb :rainbow
  end

  get '/team' do
    erb :team
  end

  get '/youtube' do
    erb :youtube
  end

  post '/subscribe' do
    @full_name = params[:full_name]
    @email = params[:email]

    if !@email.match(/.+@.+/)
      redirect to('/?error=email')
    end

    erb :subscribe
  end

  get '/reddit' do
    # TODO: we can probably get the listings with something like:
    # JSON.parse(RestClient.get('http://reddit.com/.json'))

    @listings = []

    erb :reddit
  end

  get '/schedule' do
    @today = [
      ['7:00am', 'Wake up'],
      ['8:00am', 'Work Out'],
      ['9:00am', 'Product Meeting'],
      ['11:00am', 'Ping Pong Break'],
      ['1:00pm', 'Lunch'],
      ['3:00pm', 'Coffee Time'],
      ['6:30pm', 'Call it a day'],
    ]

    @tomorrow = [
      ['7:00am', 'Wake up'],
      ['8:00am', 'Work Out'],
      ['9:00am', 'Inbox Zero'],
      ['11:00am', 'Ping Pong Break'],
      ['1:00pm', 'Lunch'],
      ['3:00pm', 'Coffee Time'],
      ['6:30pm', 'Meetup Presentation'],
    ]

    @day_after = [
      ['6:15am', 'Wake up'],
      ['6:30am', 'Work Out'],
      ['8:00am', 'Breakfast'],
      ['9:00am', 'Hardcore Coding'],
      ['1:00pm', 'Lunch'],
      ['3:00pm', 'Coffee Time'],
      ['6:30pm', 'Bar'],
    ]

    erb :schedule
  end
end
