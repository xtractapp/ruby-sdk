module XpensifySDK
  module Error
    module_function

    def raise_from_code!(code)
      case code
      when 404 then raise NotFound
      else
        raise "Response code #{code} from API"
      end
    end

    class NotFound < StandardError; end
  end
end
