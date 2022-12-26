require 'rspec'
require './lib/phoenix'

RSpec.describe Phoenix do

	describe "The Phoenix was Self-created at the Beginning of Time" do
		it "exists" do
			phoenix = Phoenix.new("Bennu")

			expect(phoenix.name).to eq("Bennu")
		end

		xit "is born golden and stoic" do
			phoenix = Phoenix.new("Bennu")

			expect(phoenix.color).to eq("golden")
			expect(phoenix.mood).to eq("stoic")
		end

		xit "changes color & mood when feeling an emotion" do
			phoenix = Phoenix.new("Bennu")

			phoenix.feels_emotion(:cognizance)

			expect(phoenix.color).to eq("amber")
			expect(phoenix.mood).to eq("heated")
		end

		xit "has emotional awareness about how many times it has the same emotion" do
			phoenix = Phoenix.new("Bennu")

			phoenix.feels_emotion(:curiosity)
			expect(phoenix.emotional_awareness[:curiosity]).to eq(1)

			phoenix.feels_emotion(:curiosity)
			expect(phoenix.emotional_awareness[:curiosity]).to eq(2)
		end 

		xit "has emotional awareness about how many times it has had different emotions" do
			phoenix = Phoenix.new("Bennu")
		
			phoenix.feels_emotion(:exuberance)
			phoenix.feels_emotion(:exuberance)
			phoenix.feels_emotion(:exuberance)

			phoenix.feels_emotion(:gratitude)
			phoenix.feels_emotion(:gratitude)

			phoenix.feels_emotion(:autonomy)

			expect(phoenix.emotional_awareness).to eq({:exuberance => 3, :gratitude => 2, :autonomy => 1})
			expect(phoenix.emotional_awareness.include?(:sorrow)).to eq(false)
		end

		xit "changes color & mood when feeling an emotion 2, 3, and 4 times" do
			phoenix = Phoenix.new("Bennu")

			2.times { phoenix.feels_emotion(:wisdom) }
			expect(phoenix.color).to eq("scarlet")
			expect(phoenix.mood).to eq("fiery")

			phoenix.feels_emotion(:wisdom)
			expect(phoenix.color).to eq("crimson")
			expect(phoenix.mood).to eq("ablaze")

			phoenix.feels_emotion(:wisdom)
			expect(phoenix.color).to eq("deep violet")
			expect(phoenix.mood).to eq("incandescent")
		end

		xit "only releases a tear after feeling the same emotion 3 times" do
			phoenix = Phoenix.new("Bennu")
			
			2.times { phoenix.feels_emotion(:confusion) }
			expect(phoenix.releases_tear?).to be false

			phoenix.feels_emotion(:confusion)
			expect(phoenix.releases_tear?).to be true

			phoenix.feels_emotion(:confusion)
			expect(phoenix.releases_tear?).to be false
		end

		xit "bursts into flames and is reborn after feeling the same emotion 5 times" do
			phoenix = Phoenix.new("Bennu")

			5.times { phoenix.feels_emotion(:revelation) }

			expect(phoenix.color).to eq("golden")
			expect(phoenix.mood).to eq("stoic")
			expect(phoenix.emotional_awareness).to eq({})
			expect(phoenix.releases_tear?).to eq(false)
			expect(phoenix.pharaoh).to eq(nil)
		end
	end

	describe "Pharaohs can Exist" do
		xit "pharaohs have names, reputations, a dynastic period, and the phoenix" do
			phoenix = Phoenix.new("Bennu")
			
			narmer = Pharaoh.new("Narmer", "The Unifier", "3100 BCE", phoenix)
			khufu = Pharaoh.new("Khufu", "The Builder", "2600 BCE", phoenix)
			tutankhamun = Pharaoh.new("Tutankhamun", "The Child", "1500 BCE", phoenix)

			expect(narmer.name).to eq("Narmer")
			expect(narmer.reputation).to eq("The Unifier")
			expect(narmer.dynastic_period).to eq("3100 BCE")

			expect(khufu.name).to eq("Khufu")
			expect(khufu.reputation).to eq("The Builder")
			expect(khufu.dynastic_period).to eq("2600 BCE")

			expect(tutankhamun.name).to eq("Tutankhamun")
			expect(tutankhamun.reputation).to eq("The Child")
			expect(tutankhamun.dynastic_period).to eq("1500 BCE")
		end

		xit "pharaohs can check if they are healthy" do
			phoenix = Phoenix.new("Bennu")
			
			narmer = Pharaoh.new("Narmer", "The Unifier", "3100 BCE", phoenix)
			khufu = Pharaoh.new("Khufu", "The Builder", "2600 BCE", phoenix)
			tutankhamun = Pharaoh.new("Tutankhamun", "The Child", "1500 BCE", phoenix)

			expect(narmer.healthy?).to eq(true)
			expect(khufu.healthy?).to eq(true)
			expect(tutankhamun.healthy?).to eq(true)
		end
	end

	describe "The Phoenix throughout Ancient Egypt" do
		xit "the phoenix chooses to follow the pharaoh" do
			phoenix = Phoenix.new("Bennu")
			narmer = Pharaoh.new("Narmer", "The Unifier", "3100 BCE", phoenix)
			
			phoenix.follows_pharaoh(narmer)

			expect(phoenix.pharaoh).to eq(narmer)
		end

		xit "the pharaoh becomes unhealthy at the age of 18" do
			phoenix = Phoenix.new("Bennu")
			narmer = Pharaoh.new("Narmer", "The Unifier", "3100 BCE", phoenix)
			phoenix.follows_pharaoh(narmer)

			narmer.age(17)
			expect(narmer.healthy?).to eq(true)
			
			narmer.age(18)
			expect(narmer.healthy?).to eq(false)

			narmer.age(19)
			expect(narmer.healthy?).to eq(false)
		end

		xit "the phoenix feels an emotion when the pharaoh takes an action" do
			phoenix = Phoenix.new("Bennu")
			khufu = Pharaoh.new("Khufu", "The Builder", "3150 BCE", phoenix)
			phoenix.follows_pharaoh(khufu)

			khufu.takes_action(:perseverance)
			expect(phoenix.emotional_awareness[:perseverance]).to eq(1)
		end

		xit "the phoenix releases a tear after the pharaoh takes the same 3 actions" do
			phoenix = Phoenix.new("Bennu")
			khufu = Pharaoh.new("Khufu", "The Builder", "3150 BCE", phoenix)
			phoenix.follows_pharaoh(khufu)

			3.times { khufu.takes_action(:perseverance) }
			expect(phoenix.releases_tear?).to eq(true)
		end

		xit "the unhealthy pharaoh becomes healthy after the phoenix releases a tear" do
			phoenix = Phoenix.new("Bennu")
			tutankhamun = Pharaoh.new("Tutankhamun", "The Child", "1500 BCE", phoenix)
			phoenix.follows_pharaoh(tutankhamun)

			expect(tutankhamun.healthy?).to eq(true)
			
			tutankhamun.age(18)
			expect(tutankhamun.healthy?).to eq(false)

			3.times { tutankhamun.takes_action(:compassion) }
			expect(phoenix.releases_tear?).to eq(true)
			
			expect(tutankhamun.healthy?).to eq(true)
		end

		xit "when the pharaoh dies the phoenix feels sorrow 5 times, bursts into flames, and is reborn" do
			phoenix = Phoenix.new("Bennu")
			tutankhamun = Pharaoh.new("Tutankhamun", "The Child", "1500 BCE", phoenix)
			phoenix.follows_pharaoh(tutankhamun)

			tutankhamun.age(19)
			expect(tutankhamun.alive?).to eq(true)

			4.times { tutankhamun.takes_action(:trepidation) }
			expect(phoenix.emotional_awareness[:trepidation]).to eq(4)
			expect(phoenix.color).to eq("deep violet")
			expect(phoenix.mood).to eq("incandescent")

			tutankhamun.dies
			expect(tutankhamun.alive?).to eq(false)

			expect(phoenix.color).to eq("golden")
			expect(phoenix.mood).to eq("stoic")
			expect(phoenix.emotional_awareness).to eq({})
			expect(phoenix.releases_tear?).to eq(false)
			expect(phoenix.pharaoh).to eq(nil)
		end
	end
end
