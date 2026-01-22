package com.petauthority.medical;

import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@RestController
@RequestMapping("/api/medical")
public class MedicalController {

    @Autowired
    private MedicalRecordRepository medicalRecordRepository;

    @Autowired
    private VaccineRepository vaccineRepository;

    @GetMapping("/records/{petId}")
    public List<MedicalRecord> getRecords(@PathVariable Long petId) {
        return medicalRecordRepository.findByPetId(petId);
    }

    @GetMapping("/vaccines/{petId}")
    public List<Vaccine> getVaccines(@PathVariable Long petId) {
        return vaccineRepository.findByPetId(petId);
    }
}

@Repository
interface MedicalRecordRepository extends JpaRepository<MedicalRecord, Long> {
    List<MedicalRecord> findByPetId(Long petId);
}

@Repository
interface VaccineRepository extends JpaRepository<Vaccine, Long> {
    List<Vaccine> findByPetId(Long petId);
}
