module SocialNetwork
  class ApiService
    SOCIAL_NETWORK_LIST = {"twitter": "https://takehome.io/twitter", "facebbook": "https://takehome.io/facebook", "instagram": "https://takehome.io/instagram"}.freeze
    SOCIAL_NETWORK_LIST_ITEM = ['status', 'tweet', 'picture'].freeze

    def get_social_network_response
      payload = {}
      SOCIAL_NETWORK_LIST.each do |site, link|
        payload.merge!(individual_site_response(site, link))
      end
      return payload
    end

    private

    def individual_site_response(site, link)
      response = HTTParty.get(link)
      response.code == 200 ? { "#{site}": get_user_messages(JSON.parse(response.body))} : { "#{site}": ["ERROR CODE #{response.code}": response.message]}
    end

    def get_user_messages(data)
      statuses = []
      SOCIAL_NETWORK_LIST_ITEM.each do |item|
        data.each do |each_user|
	  	  statuses << each_user[item] if !!(each_user[item])
	  	end
	  end
	  statuses
    end
  end
end