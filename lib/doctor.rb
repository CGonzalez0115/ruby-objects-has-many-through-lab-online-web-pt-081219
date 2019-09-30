class Doctor
  attr_reader :name, :appointment, :patient

  @@all_doc = []
  def initialize(name)
    @name = name
    @@all_doc << self
  end

  def self.all
    @@all_doc
  end

  def appointments
    Appointment.all.select {|appointment| appointment.doctor == self}
  end

  def new_appointment(patient, date)
    Appointment.new(patient, date, self)
  end

  def patients
    self.appointments.collect {|appointment| appointment.patient}
  end
end
