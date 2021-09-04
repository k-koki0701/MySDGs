5.times do |n|
  User.create!(
    name: "テスト太郎#{n + 1}",
    email: "test#{n + 1}@test.com",
    password: 'password',
    password_confirmation: 'password',
    icon: File.open("./public/images/user_icon#{n + 1}.jpg"),
    self_introduction: 'こんにちは！！'
  )
end

User.create!(
  name: '管理者',
  email: 'admin@example.com',
  password: 'kokoko',
  password_confirmation: 'kokoko',
  admin: true,
  icon: File.open('./public/images/user_icon1.jpg'),
  self_introduction: 'こんにちは！！'
)

categorys = [
  '貧困をなくそう',
  '飢餓をゼロに',
  'すべての人に健康と福祉を',
  '質の高い教育をみんなに',
  'ジェンダー平等を実現しよう',
  '安全な水とトイレを世界中に',
  'エネルギーをみんなに そしてクリーンに',
  '働きがいも経済成長も',
  '産業と技術革新の基盤をつくろう',
  '人や国の不平等をなくそう',
  '住み続けられるまちづくりを',
  'つくる責任 つかう責任',
  '気候変動に具体的な対策を',
  '海の豊かさを守ろう',
  '陸の豊かさも守ろう',
  '平和と公正をすべての人に',
  'パートナーシップで目標を達成しよう'
]

categorys.length.times do |i|
  Category.create!(
    name: categorys[i]
  )
end

5.times do |n|
  Post.create!(
    content: '道でゴミ拾い',
    user_id: n + 1,
    category_ids: n + 1
  )
end

5.times do |n|
  Post.create!(
    content: '海でゴミ拾い',
    user_id: n + 1,
    category_ids: n + 1
  )
end

0.upto(9) do |n|
  Picture.create!(
    post_id: n + 1,
    image: File.open("./public/images/post_image#{n + 1}.jpg")
  )
end

5.times do |n|
  Event.create!(
    title: 'ゴミ拾い',
    content: '海でゴミ拾いしましょう！！',
    image: File.open("./public/images/post_image#{5 + 1}.jpg"),
    schedule: '2021/12/30 12:00',
    owner_id: n + 1,
    category_id: 14
  )
end

3.times do |n|
  Good.create!(
    user_id: 1,
    post_id: n + 1
  )
end

2.times do |n|
  Good.create!(
    user_id: 2,
    post_id: n + 3
  )
end

2.times do |n|
  Relationship.create!(
    follower_id: 1,
    followed_id: n + 2
  )
end

1.times do |n|
  Relationship.create!(
    follower_id: 2,
    followed_id: n + 3
  )
end

2.times do |n|
  Relationship.create!(
    follower_id: 3,
    followed_id: n + 1
  )
end

1.times do |_n|
  Conversation.create!(
    sender_id: 1,
    recipient_id: 2
  )
end

4.times do |n|
  Message.create!(
    body: "こんにちは！#{n}",
    conversation_id: 1,
    user_id: 1
  )
end

4.times do |n|
  Message.create!(
    body: "初めまして！#{n}",
    conversation_id: 1,
    user_id: 2
  )
end

1.times do |_n|
  Conversation.create!(
    sender_id: 2,
    recipient_id: 1
  )
end

5.times do |_n|
  Message.create!(
    body: 'Yes!',
    conversation_id: 1,
    user_id: 2
  )
end

1.times do |_n|
  Conversation.create!(
    sender_id: 4,
    recipient_id: 3
  )
end

5.times do |_n|
  Message.create!(
    body: 'よろしくお願いします！',
    conversation_id: 2,
    user_id: 4
  )
end

1.times do |_n|
  Conversation.create!(
    sender_id: 3,
    recipient_id: 4
  )
end

5.times do |_n|
  Message.create!(
    body: 'よろしくお願いします！',
    conversation_id: 4,
    user_id: 3
  )
end

1.times do |_n|
  Conversation.create!(
    sender_id: 5,
    recipient_id: 3
  )
end

5.times do |_n|
  Message.create!(
    body: 'よろしくお願いします！',
    conversation_id: 5,
    user_id: 5
  )
end

3.times do |n|
  Participation.create!(
    user_id: 4,
    event_id: n + 1
  )
end

2.times do |n|
  Participation.create!(
    user_id: 5,
    event_id: n + 1
  )
end

5.times do |_n|
  Comment.create!(
    content: 'こんにちは！',
    user_id: 1,
    post_id: 1
  )
end
