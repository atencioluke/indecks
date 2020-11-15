module SlugMod
    module ClassMethods
        def find_by_slug_and_user_id(slug, user_id)
          self.all.find{|i| i.slug == slug && i.user_id == user_id}
        end
      end
    
      module InstanceMethods
        def slug
            #strip the string
            slg = self.name.strip

            #downcase
            slg.downcase!
        
            #remove apostrophes
            slg.gsub!(/['`]/,"")
        
            # @ --> at, and & --> and
            slg.gsub!(/\s*@\s*/, " at ")
            slg.gsub!(/\s*&\s*/, " and ")
        
            #replace all non alphanumeric, underscore or periods with hyphen
            slg.gsub!(/\s*[^A-Za-z0-9\.\-]\s*/, '-')
    
            #convert double hyphen to single
            slg.gsub!(/-+/,"-")
    
            #strip off leading/trailing hyphen
            slg.gsub!(/\A[-\.]+|[-\.]+\z/,"")
    
            slg
          end
      end
end