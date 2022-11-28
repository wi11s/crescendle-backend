User.create(email: 'ws@gmail.com', name: 'ws', password: '123')
User.create(email: 'jj@gmail.com', name: 'jj', password: '123')

Song.create(name: 'Example', artist: 'Example', abc_notation: 'X:1\nT:Example\nM:4/4\nC:Trad.\nK:G\n|:Gccc dedB|dedB dedB|c2ec B2dB|c2A2 A2BA|', info: 'Example', user_id: nil)
Song.create(name: 'Tulloch Gorm', artist: 'Jack Campin', abc_notation: 'X:1\nT:Example\nM:8/4\nK:CMin\nad|gce2|fdad|fgad|fdad|gce2|ddag|Tf2ef:|ddab|cce2|ddab|cded|cbac|ece2|ddag|Tf2ef:|', info: 'Example', user_id: nil)
