# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([{name: 'Frankie'}, {name: 'Rico'}])

polls = Poll.create([{user_id: 1}, {user_id: 2}])

questions = Question.create([{title: 'Colors', poll_id: 1}, {title: 'Animals', poll_id: 2}])

answers = Answer.create([{question_id: 1, body: 'blue'}, {question_id: 1, body: 'red'},
            {question_id: 2, body: 'dog'}, {question_id: 2, body: 'cat'}])


votes = Vote.create([{user_id: 1, answer_id: 1}, {user_id: 1, answer_id: 3},
                     {user_id: 2, answer_id: 2}, {user_id: 2, answer_id: 3}])

