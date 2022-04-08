class Rack::Attack

    ### Configure Cache ###
  
    # If you don't want to use Rails.cache (Rack::Attack's default), then
    # configure it here.
    #
    # Note: The store is only used for throttling (not blocklisting and
    # safelisting). It must implement .increment and .write like
    # ActiveSupport::Cache::Store
  
    # Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new 
  
    # Example config file https://github.com/rack/rack-attack/blob/master/docs/example_configuration.md
    # Docs https://github.com/rack/rack-attack

    # Note: If you're serving assets through rack, those requests may be
    # counted by rack-attack and this throttle may be activated too
    # quickly. If so, enable the condition to exclude them from tracking.
  
    # Throttle all requests by IP (60rpm)
    #
    # Key: "rack::attack:#{Time.now.to_i/:period}:req/ip:#{req.ip}"
    throttle('req/ip', limit: 300, period: 5.minutes) do |req|
      req.ip unless req.path.start_with?('/assets')
    end

  
    # Key: "rack::attack:#{Time.now.to_i/:period}:logins/ip:#{req.ip}"
    throttle('free_trials/ip', limit: 5, period: 20.seconds) do |req|
      if (req.path == '/try' || req.path == '/uk/try') && req.post?
        req.ip
      end
    end

    throttle('book_demo/ip', limit: 5, period: 20.seconds) do |req|
        if (req.path == '/book_demo' || req.path == '/uk/book_demo') && req.post?
          req.ip
        end
      end

      if Rails.env.development?
        class Rack::Attack::Request < ::Rack::Request
          def localhost?
            ip == "127.0.0.1"
          end
        end
        
        Rack::Attack.safelist("localhost") { |req| req.localhost? }
      end
  
    ### Custom Throttle Response ###
  
    # By default, Rack::Attack returns an HTTP 429 for throttled responses,
    # which is just fine.
    #
    # If you want to return 503 so that the attacker might be fooled into
    # believing that they've successfully broken your app (or you just want to
    # customize the response), then uncomment these lines.
    self.throttled_response = lambda do |env|
     [ 503,  # status
       {},   # headers
       ['']] # body
    end
  end