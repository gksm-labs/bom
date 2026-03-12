edition = Edition.create!(
  year: Date.current.year,
  date: Time.zone.local(Date.current.year, 6, 20, 9, 0, 0),
  registration_starts_at: Time.zone.now.beginning_of_day - 1.week,
  registration_ends_at: Time.zone.local(Date.current.year, 6, 18, 23, 59, 59),
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

dokumenty = Cms::Category.create!(
  name: "Dokumenty a propozície",
  slug: "propositions"
)

dokumenty.pages.create!([
                          {
                            title: "Oficiálne propozície",
                            slug: "propozicie-2026",
                            published: true,
                            content: <<~HTML
      <h2>Základné informácie</h2>
      <p>Beh okolo Modry je komunitné športové podujatie pre všetky vekové kategórie. Trasa vedie cez krásne lesné úseky a ponúka bezpečné zázemie, občerstvenie a skvelú atmosféru.</p>

      <h3>Štartovné zahŕňa:</h3>
      <ul>
        <li>Štartové číslo s nevratným čipom</li>
        <li>Účastnícku medailu v cieli</li>
        <li>Občerstvenie na trati a v cieli (voda, iontový nápoj, ovocie)</li>
        <li>Zdravotnú službu</li>
      </ul>

      <h3>Upozornenie</h3>
      <p>Každý pretekár štartuje na vlastnú zodpovednosť. Organizátor nezodpovedá za škody na majetku a zdraví súvisiace s účasťou na podujatí.</p>
    HTML
                          },
                          {
                            title: "Trasa 10 km",
                            slug: "trasa-10km",
                            published: true,
                            content: <<~HTML
      <h2>Popis trasy</h2>
      <p>Okruh vedie cez lesné cesty a centrum Modry. Trasa je prehľadne značená smerovými šípkami a na kľúčových bodoch budú usmerňovať bežcov naši dobrovoľníci.</p>

      <h3>Technické parametre:</h3>
      <ul>
        <li><strong>Dĺžka:</strong> 10 km</li>
        <li><strong>Prevýšenie:</strong> ~180 m</li>
        <li><strong>Povrch:</strong> 70% lesné cesty, 30% asfalt</li>
        <li><strong>Časový limit:</strong> 2 hodiny</li>
      </ul>
    HTML
                          },
                          {
                            title: "Pokyny pre pretekárov",
                            slug: "pokyny-pretekari",
                            published: true,
                            content: <<~HTML
      <h2>Dôležité pokyny pred štartom</h2>
      <p>Prosíme všetkých pretekárov, aby si pozorne prečítali nasledujúce pokyny pre hladký priebeh podujatia.</p>

      <ol>
        <li>Dostavte sa na prezentáciu aspoň <strong>45 minút</strong> pred štartom vašej kategórie.</li>
        <li>Štartové číslo si pripevnite viditeľne na hruď. Čip je súčasťou čísla, neprelamujte ho!</li>
        <li>Rešpektujte pokyny organizátorov a dobrovoľníkov na trati.</li>
        <li>Zanechajte po sebe čistú prírodu – odpadky vhadzujte len do pripravených nádob na občerstvovacích staniciach.</li>
      </ol>
    HTML
                          },
                          {
                            title: "GDPR a súhlasy",
                            slug: "gdpr-suhlas",
                            published: true,
                            content: <<~HTML
      <h2>Ochrana osobných údajov</h2>
      <p>Spracovanie vašich osobných údajov prebieha v prísnom súlade s platnou legislatívou o ochrane osobných údajov (GDPR).</p>

      <h3>Aké údaje spracúvame?</h3>
      <p>Pre účely registrácie, vyhodnotenia pretekov a zaslania informácií spracúvame vaše meno, priezvisko, rok narodenia, e-mail a klubovú príslušnosť.</p>

      <h3>Fotografie a video</h3>
      <p>Súčasťou registrácie je aj súhlas s vyhotovením a zverejnením fotografií z podujatia na našich webových stránkach a sociálnych sieťach za účelom propagácie podujatia.</p>
    HTML
                          }
                        ])
