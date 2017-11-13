# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

json = ActiveSupport::JSON.decode(File.read('public/users.json'))

json.each do |a|
  user = User.create!(_id: a['_id'], url:a['url'], external_id:a['external_id'], name:a['name'], alias:a['alias'], created_at:a['created_at'], active: a['active'],
  verified:a['verified'], shared:a['shared'], locale: a['locale'], timezone: a['timezone'], last_login_at:a['last_login_at'],
  email:a['email'], phone:a['phone'], signature:a['signature'], organization_id:a['organization_id'], tags:a['tags'], suspended:a['suspended'],
  role:a['role'], updated_at:a['updated_at'])
end

json_tickets = ActiveSupport::JSON.decode(File.read('public/tickets.json'))

json_tickets.each do |t|
  Ticket.create!(_id:t['_id'], url:t['url'], external_id:t['external_id'], created_at:t['created_at'], ticket_type:t['type'],
  subject:t['subject'], description:t['description'], priority:t['priority'], status:t['status'], submitter_id:t['submitter_id'],
  assignee_id:t['assignee_id'], organization_id:t['organization_id'], tags:t['tags'], has_incidents:t['has_incidents'],
  due_at:t['due_at'], via:t['via'])
end

json_org = ActiveSupport::JSON.decode(File.read('public/organizations.json'))

json_org.each do |o|
  Organization.create(_id:o['_id'], url:o['url'], external_id:o['external_id'],
    name:o['name'], domain_names:o['domain_names'], created_at:o['created_at'],
    details:o['details'], shared_tickets:o['shared_tickets'], tags:o['tags'])
end
