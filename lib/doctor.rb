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

  def appointments
    Appointment.all.select do |appointment|
      appointment.doctor == self
    end
  end

  def new_appointment(patient, date)
    Appointment.new(patient, date, self)
  end

  def patients
    self.appointments.collect {|appointment| appointment.patient}
  end
end
