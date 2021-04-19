  User.create!(
    email: 'admin@gmail.com',
    name: '管理者',
    password: "adminadmin",
    admin: true
  )

  30.times do |n|
    User.create!(
      email: "test#{n + 1}@gmail.com",
      name: Gimei.name.kanji,
      password: "testtest#{n+1}",
      admin: false
    )
  end

  User.where.not(id: 1).each do |user|
    user.working_places.create!(
      address: Gimei.address.kanji,
    )
  end

    30.times do |n|
    date = DateTime.new(2021,03,n+1)
      wday = case date.wday
        when 0
          "日"
        when 1
          "月"
        when 2
          "火"
        when 3
          "水"
        when 4
          "木"
        when 5
          "金"
        when 6
          "土"
      end
        User.where.not(id: 1).each do |user|
          user.attendances.create!(
            date: date,
            year: 2021,
            month: 3,
            day: n+1,
            wday: wday,
            attendance_time: Time.new(2021,03,n+1,06,00,0),
            leaving_time: Time.new(2021,03,n+1,18,00,0),
            working_times: 540,
            overtime_hours: 180,
            early_attendance: 120,
            late_leaving: 60,
            working_place: Gimei.address.kanji
          )
        end
    end

    19.times do |n|
    date = DateTime.new(2021,04,n+1)
      wday = case date.wday
        when 0
          "日"
        when 1
          "月"
        when 2
          "火"
        when 3
          "水"
        when 4
          "木"
        when 5
          "金"
        when 6
          "土"
      end
        User.where.not(id: 1).each do |user|
          user.attendances.create!(
            date: date,
            year: 2021,
            month: 4,
            day: n+1,
            wday: wday,
            attendance_time: Time.new(2021,04,n+1,06,00,0),
            leaving_time: Time.new(2021,04,n+1,18,00,0),
            working_times: 540,
            overtime_hours: 180,
            early_attendance: 120,
            late_leaving: 60,
            working_place: Gimei.address.kanji
          )
        end
    end
