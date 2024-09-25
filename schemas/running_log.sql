-- dbdiagram.io/d
Table user {
  user_id integer [primary key]
  username varchar
  email varchar
  created_at timestamp
  updated_at timestamp
  provider varchar
  providerId varchar
  accessToken varchar
  refreshToken varchar
}

Table workout {
  workout_id integer [primary key]
  user_id integer
  activity_date timestamp
  total_distance float
  distance_unit enum('mi', 'km')
  total_time interval
  heart_rate integer
  max_heart_rate integer
  comments text
  warm_up float
  cool_down float
  time_of_day_id interval
  terrain_type_id interval
  weather_id interval
  temperature_id interval
  run_type_id interval
  shoe_id interval
  humidity_id interval
  injury_type_id interval
  exertion_level_id interval
  difficulty_level_id interval
  attitude_level_id interval
  is_race boolean
  share_this_workout boolean
  mark_workout boolean
  totally_private_note text
  users_weather_description text
  users_injury_description text
  temperature interval
  temperature_unit enum('C', 'F')
  cross_training_comments text
  is_relay_split boolean
  created_at timestamp
  updated_at timestamp
}

Table race_details {
  race_details_id integer [primary key]
  workout_id integer
  race_name varchar
  race_distance integer
  distance_unit enum('mi', 'km')
  race_time interval
  overall_place integer
  age_group_place interval
  race_comments text
  race_location varchar
  race_warm_up float
  race_cool_down float
  race_type_terrain_id integer
  created_at timestamp
  updated_at timestamp
}

Table shoe {
  shoe_id interval [primary key]
  user_id interval
  name varchar
  brand_description text
  type_description text
  created_at timestamp
  updated_at timestamp
}

Table user_metrics {
  user_metrics_id interval [primary key]
  user_id interval
  metric_date timestamp
  weight float
  body_fat_percentage interval
  morning_heart_rate interval
  hours_of_sleep float
  menstruating boolean
  created_at timestamp
  updated_at timestamp
}

-- LOOK UP TABLE
Table run_type {
  run_type_id interval
  description text
}
Table time_of_day {
  time_of_day_id interval
  description text
}
Table terrain_type {
  terrain_type_id interval
  description text
}
Table weather {
  weather_id interval
  description text
}
Table temperature {
  temperature_id interval
  description text
}
Table humidity {
  humidity_id interval
  description text
}
Table injury_type {
  injury_type_id interval
  description text
}
Table exertion_level {
  exertion_level_id interval
  description text
}
Table difficulty_level {
  difficulty_level_id interval
  description text
}
Table attitude_level {
  attitude_level_id interval
  description text
}

-- // Ref: posts.user_id > users.id // many-to-one
Ref: workout.user_id > user.user_id
Ref: race_details.workout_id > workout.workout_id
Ref: shoe.user_id > user.user_id
Ref: user_metrics.user_id > user.user_id

-- // Lookup table refs
-- // one-to-one
Ref: run_type.run_type_id - workout.run_type_id
Ref: time_of_day.time_of_day_id - workout.time_of_day_id 
Ref: terrain_type.terrain_type_id - workout.terrain_type_id 
Ref: weather.weather_id - workout.weather_id 
Ref: temperature.temperature_id - workout.temperature_id 
Ref: shoe.shoe_id - workout.shoe_id 
Ref: humidity.humidity_id - workout.humidity_id 
Ref: injury_type.injury_type_id - workout.injury_type_id 
Ref: exertion_level.exertion_level_id - workout.exertion_level_id 
Ref: difficulty_level.difficulty_level_id - workout.difficulty_level_id 
Ref: attitude_level.attitude_level_id- workout.attitude_level_id