require 'rubygems'
require 'unirest'
require 'pry'

module GHFeed
  class RepoInfo
    def self.get_repo_data(username, repo)
      url = "https://api.github.com/repos/#{username}/#{repo}/commits"
      response = Unirest.get url, auth:{ :user=>ENV["PASSWORD"]}
      response.body
    # binding.pry
    end
  end
  class UserInfo
    def self.gravatar_url(username)
    url = "https://api.github.com/users/#{username}"
    response = Unirest.get url, auth:{ :user=>ENV["PASSWORD"]}
    response.body
    grav_id = response.body['gravatar_id']
    gravatar_url = "https://secure.gravatar.com/avatar/#{grav_id}"
    end
  end
end
