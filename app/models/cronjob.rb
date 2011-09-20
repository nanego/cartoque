class Cronjob < ActiveRecord::Base
  belongs_to :server

  validates_presence_of :server, :frequency, :command

  scope :by_server, proc { |server_id| where(:server_id => server_id) }
  scope :by_command, proc { |search| where("cronjobs.command LIKE ?", "%#{search}%") }
  scope :by_definition, proc { |place| where("cronjobs.definition_location LIKE ?", "%#{place}%") }

  def self.parse_line(line)
    #typical line: "0 6 * * * root /usr/bin/my_script.sh >/dev/null && blah
    cron = Cronjob.new
    elems = line.strip.split(/\s+/)
    if elems.first && elems.first.match(%r{^(/|crontab)})
      cron.definition_location = elems.shift
    end
    if elems.size >= 6 && !elems.first.match(/^\s*[#a-z]/)
      cron.frequency = elems[0..4].join(" ")
      cron.user = elems[5]
      cron.command = elems[6..-1].join(" ")
    end
    cron
  end
end
