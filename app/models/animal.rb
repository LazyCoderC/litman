class Animal < ApplicationRecord
  include HTTParty

  def self.fetch
    url = 'https://axoltlapi.herokuapp.com/'
    response = HTTParty.get(url)
    ceshi = JSON.parse(response.to_json)
    url = ceshi["url"]
    facts = ceshi["facts"]
    pics_repo = ceshi["pics_repo"]
    api_repo = ceshi["api_repo"]
    Animal.create(url: url, facts: facts, pics_repo: pics_repo, api_repo: api_repo)
    # raise api_repo.to_json
  end
end
