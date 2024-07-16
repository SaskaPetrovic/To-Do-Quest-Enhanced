# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.destroy_all


#creation d'un user
user = User.create!(email: "test@test.com", password: "123456", experience: 0, level: 0, roles: "", username: "")

#creation de 5 categories
Category.destroy_all
category1 = Category.create!(title: "Domestic", description: "Tasks requiring strength and endurance, often related to home maintenance")




CLASS:
–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
Rogue (INT)
Mage (MANA)
Ranger (DEX)
Knight (STR)
Bard (CHA)


STATS:
–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
INT (intelligence)
MANA (mana)
DEX (dexterity)
STR (strength)
CHA (charisma)



CATEGORIES:
–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
1. Domestic (Knight - STR)
- Tasks requiring strength and endurance, often related to home maintenance.

SUB-CATEGORIES
⁃	Moving furniture
⁃	Intensive gardening
⁃	Deep cleaning
⁃	Home repairs
⁃	Groceries shopping

——————————————

2. Work/School (Rogue - INT)
- Professional or academic tasks requiring intelligence and strategy.

SUB-CATEGORIES
⁃	Answering emails
⁃	Finishing assignments
⁃	Completing a presentation
⁃	Updating a project plan
⁃	Write a report

——————————————

3. Leisure & Social (Bard - CHA)
- Social and creative activities where charisma and social skills are key.

SUB-CATEGORIES
⁃	Watching a movie
⁃	Reading a book
⁃	Playing a game
⁃	Calling a family member
⁃	Hang out with friends

——————————————

4. Health & Wellness (Ranger - DEX)
- Physical tasks and activities where dexterity and coordination are important.

SUB-CATEGORIES
⁃	Taking a walk
⁃	Doing a workout routine
⁃	Stretching exercises
⁃	Preparing a healthy meal
⁃	Drinking enough water

——————————————

4. Health & Wellness (Ranger - DEX)
- Tasks aimed at self-improvement and continuous learning, requiring mental energy.

SUB-CATEGORIES
⁃	Setting personal goals
⁃	Reflecting on the day
⁃	Practicing a hobby
⁃	Journaling
⁃	Planning the week ahead
