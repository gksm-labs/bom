current_year = Date.current.year

edition = Edition.create!(
  year: current_year,
  date: Time.zone.local(current_year, 6, 20, 9, 0, 0), # 20. Jún o 9:00
  registration_starts_at: Time.zone.now.beginning_of_day - 1.week, # Registrácia beží už týždeň
  registration_ends_at: Time.zone.local(current_year, 6, 18, 23, 59, 59),
  max_capacity: 500,
  entry_fee: 15.00,
  published: true
)

edition.schedule_items.create!([
                                 { start_time: "07:30", title: "Otvorenie areálu a registrácia", description: "Prezentácia účastníkov, vyzdvihnutie štartových balíčkov.", badge_color: "primary" },
                                 { start_time: "08:45", title: "Rozcvička", description: "Spoločná dynamická rozcvička pri štartovej bráne.", badge_color: "primary" },
                                 { start_time: "09:00", title: "Štart hlavného behu (10 km)", description: "Hromadný štart všetkých registrovaných pretekárov.", badge_color: "red" },
                                 { start_time: "09:20", title: "Štart hobby behu (5 km)", description: "Voľnejšie tempo, ideálne pre rekreačných bežcov.", badge_color: "green" },
                                 { start_time: "11:00", title: "Detské behy", description: "Kategórie podľa veku, bezpečný okruh pri areáli.", badge_color: "primary" },
                                 { start_time: "12:30", title: "Vyhlásenie výsledkov", description: "Ocenenie víťazov kategórií a tombola.", badge_color: "primary" }
                               ])

edition.registrations.create!([
                                {
                                  first_name: "Jozef",
                                  last_name: "Rýchly",
                                  birth_date: Date.new(1985, 4, 12),
                                  gender: "male",
                                  city: "Modra",
                                  email: "jozef.rychly@example.com",
                                  phone: "+421900111222",
                                  discipline: "main_10km",
                                  t_shirt_size: "l",
                                  club: "Modra Runners",
                                  gdpr_consent: true,
                                  terms_consent: true
                                },
                                {
                                  first_name: "Anna",
                                  last_name: "Vytrvalá",
                                  birth_date: Date.new(1992, 8, 25),
                                  gender: "female",
                                  city: "Pezinok",
                                  email: "anna.vytrvala@example.com",
                                  phone: "+421900555666",
                                  discipline: "hobby_5km",
                                  t_shirt_size: "s",
                                  gdpr_consent: true,
                                  terms_consent: true
                                }
                              ])
