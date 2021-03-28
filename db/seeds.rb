  User.create!(
    email: 'admin@gmail.com',
    name: '管理者',
    password: "adminadmin",
    admin: true
  )

  10.times do |n|
    User.create!(
      email: "test#{n + 1}@gmail.com",
      name: Gimei.name.kanji,
      password: "testtest#{n+1}",
      admin: false
    )
  end

  WorkingPlace.create!(
    address: "名古屋市瑞穂区東栄町5-12-3"
  )

  User.all.each do |user|
    user.working_places.create!(
      address: Gimei.address.kanji,
    )
  end

  User.all.each do |user|
    Relationship.create!(
      user_id: user.id,
      working_place_id: 1
    )
  end

    30.times do |n|
    User.second.attendances.create!(
      user_id: 1,
      year: 2021,
      month: 3,
      day: n+1,
      wday: "月曜日",
      attendance_time: Time.new(2000,01,01,06,00,0),
      leaving_time: Time.new(2000,01,01,18,00,0),
      working_times: 540,
      overtime_hours: 180,
      early_attendance: 120,
      late_leaving: 60,
      working_place: Gimei.address.kanji
    )
  end

    30.times do |n|
    User.second.attendances.create!(
      user_id: 1,
      year: 2021,
      month: 4,
      day: n+1,
      wday: "日曜日",
      attendance_time: Time.new(2000,01,01,06,00,0),
      leaving_time: Time.new(2000,01,01,18,00,0),
      working_times: 540,
      overtime_hours: 180,
      early_attendance: 120,
      late_leaving: 60,
      working_place: Gimei.address.kanji
    )
  end
