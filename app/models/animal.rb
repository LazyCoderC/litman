class Animal < ApplicationRecord
  include HTTParty



  def self.fetch
    base_uri = 'https://axoltlapi.herokuapp.com/'
    response = HTTParty.get(base_uri)
    api = JSON.parse(response.to_json)
    url = api["url"]
    facts = api["facts"]
    pics_repo = api["pics_repo"]
    api_repo = api["api_repo"]
    Animal.create(url: url, facts: facts, pics_repo: pics_repo, api_repo: api_repo)
    # raise api_repo.to_json
  end

  def push_remote
    animal = Animal.first
    # raise animal.to_json
    HTTParty.post("http://requestbin.net/r/f1c4d0z1", {
      body: {
        url: animal.url,
        facts: animal.facts,
        pics_repo: animal.pics_repo,
        api_repo: animal.api_repo
      },
      headers: {
        'Content-Type' => 'application/x-www-form-urlencoded',
        'charset' => 'utf-8'}
    })
  end
end
