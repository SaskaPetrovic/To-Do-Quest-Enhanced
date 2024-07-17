Task.destroy_all
SubCategory.destroy_all
Category.destroy_all
User.destroy_all
#creation d'un user
user = User.create!(email: "test@test.com", password: "123456", roles: "", experience: 0, level: 1)

#creation de 5 categories(=stats)

intellect = Category.create!(title: "Domestic", description: "Tasks requiring strength and endurance, often related to home maintenance")
mana = Category.create!(title: "Work/School", description: "Professional or academic tasks requiring intelligence and strategy")
dexterity = Category.create!(title: "Leisure & Social", description: "Social and creative activities where charisma and social skills are key")
strength = Category.create!(title: "Health & Wellness", description: "Physical tasks and activities where power and coordination are important")
charisma = Category.create!(title: "Personal Growth", description: "Tasks aimed at self-improvement and continuous learning, requiring mental energy")

puts "Categories created!"
#creation de 5 sub_categories(=class) pour chaque category

rogue1 = SubCategory.create!(title: "Moving furniture", description: "Embarking on a quest to rearrange the fortress, shifting the colossal structures to bring a fresh aura to your stronghold", category: intellect)
rogue2 = SubCategory.create!(title: "Intensive gardening", description: "Harnessing the power of nature, you toil under the sun and rain, shaping the wilderness into a bountiful garden of Eden", category: intellect)
rogue3 = SubCategory.create!(title: "Deep cleaning", description: "Venturing into the depths of the fortress, you cleanse the chambers of dust and grime, restoring the brilliance of the stronghold", category: intellect)
rogue4 = SubCategory.create!(title: "Home repairs", description: "Mastering the art of mending, you fix the broken structures of the fortress, ensuring its durability and longevity", category: intellect)
rogue5 = SubCategory.create!(title: "Groceries shopping", description: "Embarking on a quest to replenish the fortress's supplies, you navigate the bustling markets and shops, acquiring the necessary provisions", category: intellect)

mage1 = SubCategory.create!(title: "Answering emails", description: "Harnessing the power of intellect, you navigate the digital realm, responding to messages and inquiries with precision and clarity", category: mana)
mage2 = SubCategory.create!(title: "Finishing assignments", description: "Embarking on a quest to complete the academic tasks, you delve into the realm of knowledge, crafting essays and reports with scholarly prowess", category: mana)
mage3 = SubCategory.create!(title: "Completing a presentation", description: "Mastering the art of communication, you prepare a visual spectacle, captivating the audience with your eloquence and wit", category: mana)
mage4 = SubCategory.create!(title: "Updating a project plan", description: "Navigating the realm of strategy, you refine the blueprints of the fortress, ensuring the success of future endeavors", category: mana)
mage5 = SubCategory.create!(title: "Write a report", description: "Harnessing the power of intellect, you craft a detailed account of the fortress's activities, documenting the triumphs and challenges of the realm", category: mana)

ranger1 = SubCategory.create!(title: "Watching a movie", description: "Embarking on a quest to explore the realms of imagination, you immerse yourself in the cinematic adventures, experiencing the thrill and wonder of the silver screen", category: dexterity)
ranger2 = SubCategory.create!(title: "Reading a book", description: "Delving into the realm of literature, you journey through the pages of knowledge and wisdom, expanding your mind and spirit with the tales of old and new", category: dexterity)
ranger3 = SubCategory.create!(title: "Playing a game", description: "Embarking on a quest of skill and strategy, you challenge the forces of the digital realm, testing your reflexes and wits in the virtual arena", category: dexterity)
ranger4 = SubCategory.create!(title: "Calling a family member", description: "Navigating the realm of relationships, you reach out to the kin of the fortress, strengthening the bonds of blood and love with the power of communication", category: dexterity)
ranger5 = SubCategory.create!(title: "Hang out with friends", description: "Embarking on a quest of camaraderie and merriment, you gather the companions of the fortress, sharing laughter and joy in the company of kindred spirits", category: dexterity)

knight1 = SubCategory.create!(title: "Taking a walk", description: "Embarking on a quest of exploration and discovery, you traverse the lands of the realm, breathing the fresh air and basking in the beauty of nature", category: strength)
knight2 = SubCategory.create!(title: "Doing a workout routine", description: "Mastering the art of physical training, you engage in the exercises of strength and endurance, sculpting the body and spirit with the power of movement", category: strength)
knight3 = SubCategory.create!(title: "Stretching exercises", description: "Navigating the realm of flexibility, you perform the movements of grace and fluidity, enhancing the agility and resilience of the body with the power of flexibility", category: strength)
knight4 = SubCategory.create!(title: "Preparing a healthy meal", description: "Harnessing the power of nutrition, you gather the ingredients of vitality, crafting a feast of health and wellness to nourish the body and soul", category: strength)
knight5 = SubCategory.create!(title: "Drinking enough water", description: "Navigating the realm of hydration, you replenish the waters of life, quenching the thirst of the body and mind with the elixir of vitality", category: strength)

bard1 = SubCategory.create!(title: "Setting personal goals", description: "Embarking on a quest of self-discovery and growth, you define the aspirations and dreams of the fortress, charting the course of destiny with the power of vision", category: charisma)
bard2 = SubCategory.create!(title: "Reflecting on the day", description: "Navigating the realm of introspection, you review the events and experiences of the day, contemplating the lessons and insights gained with the power of reflection", category: charisma)
bard3 = SubCategory.create!(title: "Practicing a hobby", description: "Mastering the art of creativity and passion, you engage in the activities of joy and fulfillment, expressing the talents and interests of the soul with the power of creation", category: charisma)
bard4 = SubCategory.create!(title: "Journaling", description: "Harnessing the power of expression, you record the thoughts and emotions of the fortress, capturing the essence of the moment with the power of words", category: charisma)
bard5 = SubCategory.create!(title: "Planning the week ahead", description: "Navigating the realm of strategy and foresight, you prepare for the challenges and opportunities of the future, organizing the tasks and goals of the week with the power of planning", category: charisma)

puts "SubCategories created!"
#création de 5 tasks (par sub_category)(donc par class)

Task.create!(title: "Moving the couch", description: "Move the couch from the living room to the bedroom", status: "pending", urgence: "high", time: Time.now , rewards: "100xp", user: user, sub_category: rogue1)
Task.create!(title: "Planting flowers", description: "Plant flowers in the garden", status: "pending", urgence: "high", time: Time.now, rewards: "100xp", user: user, sub_category: rogue2)
Task.create!(title: "Cleaning the attic", description: "Clean the attic and organize the items", status: "pending", urgence: "high", time: Time.now, rewards: "100xp", user: user, sub_category: rogue3)
Task.create!(title: "Fixing the leaky faucet", description: "Fix the leaky faucet in the kitchen", status: "pending", urgence: "high", time: Time.now, rewards: "100xp", user: user, sub_category: rogue4)
Task.create!(title: "Buying groceries", description: "Go to the supermarket and buy groceries for the week", status: "pending", urgence: "high", time: Time.now, rewards: "100xp", user: user, sub_category: rogue5)

Task.create!(title: "Answering emails", description: "Answer all the emails in the inbox", status: "pending", urgence: "high", time: Time.now, rewards: "100xp", user: user, sub_category: mage1)
Task.create!(title: "Finishing an essay", description: "Write an essay on a topic of your choice", status: "pending", urgence: "high", time: Time.now, rewards: "100xp", user: user, sub_category: mage2)
Task.create!(title: "Preparing a presentation", description: "Prepare a presentation for a meeting", status: "pending", urgence: "high", time: Time.now, rewards: "100xp", user: user, sub_category: mage3)
Task.create!(title: "Updating the project plan", description: "Update the project plan with the latest information", status: "pending", urgence: "high", time: Time.now, rewards: "100xp", user: user, sub_category: mage4)
Task.create!(title: "Writing a report", description: "Write a report on the progress of the project", status: "pending", urgence: "high", time: Time.now, rewards: "100xp", user: user, sub_category: mage5)

Task.create!(title: "Watching a movie", description: "Watch a movie of your choice", status: "pending", urgence: "high", time: Time.now, rewards: "100xp", user: user, sub_category: ranger1)
Task.create!(title: "Reading a book", description: "Read a book from the library", status: "pending", urgence: "high", time: Time.now, rewards: "100xp", user: user, sub_category: ranger2)
Task.create!(title: "Playing a game", description: "Play a game on the console", status: "pending", urgence: "high", time: Time.now, rewards: "100xp", user: user, sub_category: ranger3)
Task.create!(title: "Calling a family member", description: "Call a family member to catch up", status: "pending", urgence: "high", time: Time.now, rewards: "100xp", user: user, sub_category: ranger4)
Task.create!(title: "Hanging out with friends", description: "Hang out with friends at the local cafe", status: "pending", urgence: "high", time: Time.now, rewards: "100xp", user: user, sub_category: ranger5)

Task.create!(title: "Taking a walk", description: "Go for a walk in the park", status: "pending", urgence: "high", time: Time.now, rewards: "100xp", user: user, sub_category: knight1)
Task.create!(title: "Doing a workout routine", description: "Follow a workout routine at home", status: "pending", urgence: "high", time: Time.now, rewards: "100xp", user: user, sub_category: knight2)
Task.create!(title: "Stretching exercises", description: "Do stretching exercises to improve flexibility", status: "pending", urgence: "high", time: Time.now, rewards: "100xp", user: user, sub_category: knight3)
Task.create!(title: "Preparing a healthy meal", description: "Cook a healthy meal for dinner", status: "pending", urgence: "high", time: Time.now, rewards: "100xp", user: user, sub_category: knight4)
Task.create!(title: "Drinking enough water", description: "Drink 8 glasses of water throughout the day", status: "pending", urgence: "high", time: Time.now, rewards: "100xp", user: user, sub_category: knight5)

Task.create!(title: "Setting personal goals", description: "Set personal goals for the week", status: "pending", urgence: "high", time: Time.now, rewards: "100xp", user: user, sub_category: bard1)
Task.create!(title: "Reflecting on the day", description: "Reflect on the events of the day before going to bed", status: "pending", urgence: "high", time: Time.now, rewards: "100xp", user: user, sub_category: bard2)
Task.create!(title: "Practicing a hobby", description: "Spend an hour practicing a hobby you enjoy", status: "pending", urgence: "high", time: Time.now, rewards: "100xp", user: user, sub_category: bard3)
Task.create!(title: "Journaling", description: "Write in your journal about your thoughts and feelings", status: "pending", urgence: "high", time: Time.now, rewards: "100xp", user: user, sub_category: bard4)
Task.create!(title: "Planning the week ahead", description: "Plan the tasks and goals for the upcoming week", status: "pending", urgence: "high", time: Time.now, rewards: "100xp", user: user, sub_category: bard5)

puts "Tasks created!"

#creation de 5 achievements

Achievement.create!(title: "Master of the House", description: "Complete all the domestic tasks", points: 100, user: user)
Achievement.create!(title: "Academic Excellence", description: "Complete all the academic tasks", points: 100, user: user)
Achievement.create!(title: "Social Butterfly", description: "Complete all the social tasks", points: 100, user: user)
Achievement.create!(title: "Wellness Warrior", description: "Complete all the health and wellness tasks", points: 100, user: user)
Achievement.create!(title: "Personal Growth Champion", description: "Complete all the personal growth tasks", points: 100, user: user)

#creation de 5 achievements tasks
# AchievementTask.create!(achievement: Achievement.first, task: Task.first)

# puts "Achievements tasks created!"
