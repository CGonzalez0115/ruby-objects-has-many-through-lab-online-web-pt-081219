class Doctor
  attr_reader :name, :appointment, :patient

  @@all = []
  @@all_doc = []
  def initialize(name)
    @name = name
    @@all << self
    @@all_doc << self
  end

  def self.all
    @@all
    @@all_doc
  end

  def new_appointment(doctor, date)
    Appointment.new(self, doctor, date)
  end

  def appointments
    Appointment.all.select do |appointment|
      appointment.patient == self
    end
  end

  def doctors
    Appointment.all.map do |appointment|
      appointment.doctor
    end
  end
end