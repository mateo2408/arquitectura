package com.petauthority.medical;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import java.time.LocalDate;
import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "vaccines")
public class Vaccine {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Long petId;

    private String vaccineName;

    @JsonFormat(pattern = "yyyy-MM-dd")
    private LocalDate administeredDate;

    @JsonFormat(pattern = "yyyy-MM-dd")
    private LocalDate nextDueDate;

    private String vetSignature;

    public Vaccine() {
    }

    public Vaccine(Long petId, String vaccineName, LocalDate administeredDate, LocalDate nextDueDate,
            String vetSignature) {
        this.petId = petId;
        this.vaccineName = vaccineName;
        this.administeredDate = administeredDate;
        this.nextDueDate = nextDueDate;
        this.vetSignature = vetSignature;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getPetId() {
        return petId;
    }

    public void setPetId(Long petId) {
        this.petId = petId;
    }

    public String getVaccineName() {
        return vaccineName;
    }

    public void setVaccineName(String vaccineName) {
        this.vaccineName = vaccineName;
    }

    public LocalDate getAdministeredDate() {
        return administeredDate;
    }

    public void setAdministeredDate(LocalDate administeredDate) {
        this.administeredDate = administeredDate;
    }

    public LocalDate getNextDueDate() {
        return nextDueDate;
    }

    public void setNextDueDate(LocalDate nextDueDate) {
        this.nextDueDate = nextDueDate;
    }

    public String getVetSignature() {
        return vetSignature;
    }

    public void setVetSignature(String vetSignature) {
        this.vetSignature = vetSignature;
    }
}
