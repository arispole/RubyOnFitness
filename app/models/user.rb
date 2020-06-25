class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]
   #avatar   
    has_one_attached :avatar         
    after_commit :add_default_avatar, on: %i[create update]

    def avatar_thumbnail
      if avatar.attached?      
        avatar.variant(resize: "150x150!").processed  
      else
       '/default_profile.jpg'
      end
    end
    
    private
    def add_default_avatar
       unless avatar.attached?
         avatar.attach(
           io: File.open(
              Rails.root.join(
                  'app',
                  'assets',
                   'images', 'default_profile.jpg'
                   )
            ),
              filename: 'default_profile.jpg',
              content_type: 'image/jpg'
         )   
          
        end
    end

    has_many :workout_plans, dependent: :destroy
    
    has_many :private_lessons, dependent: :destroy
    
    has_many :booked_private_lessons, dependent: :destroy
    
    has_many :group_lessons, dependent: :destroy
    
    has_many :booked_group_lessons, dependent: :destroy
         
	def self.from_omniauth(auth)
		where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
			user.email = auth.info.email
			user.password = Devise.friendly_token[0,34]
		end
	end

	def self.new_with_session(params, session)
		super.tap do |user|
			if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
				user.email = data["email"] if user.email.blank?
			end
		end
	end
  
  before_save :set_datasocio

  def set_datasocio
    self.datasocio ||= DateTime.now
  end

  
	
end
