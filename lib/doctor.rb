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
    Appointment.all.select do |appointment|
      appointment.patient
    end
  end

  def new_appointment(doctor, date)
    appointment =Appointment.new(date, self, patient)
    self.appointments.last
  end

  def doctors
    Appointment.all.select do |appointment|
      appointment.doctor = self
    end
  end

  def patients
    Appointment.all.map do |appointment|
      appointment.patients
    end
  end
end
