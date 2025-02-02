class Patient
  attr_reader :name, :doctor, :date

  @@all = []
  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def new_appointment(doctor, date)
    appointment = Appointment.new(name, self, date)
    self.appointments.last
  end

  def appointments
    Appointment.all.select do |appointment|
      appointment.patient = self
    end
  end

  def doctors
    Appointment.all.map do |appointment|
      appointment.doctor
    end
  end
end
