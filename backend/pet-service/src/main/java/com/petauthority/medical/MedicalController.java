package com.petauthority.medical;

import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;

import java.util.List;

@RestController
@RequestMapping("/api/medical")
@Tag(name = "Medical", description = "API para registros médicos y vacunas")
public class MedicalController {

    @Autowired
    private MedicalRecordRepository medicalRecordRepository;

    @Autowired
    private VaccineRepository vaccineRepository;

    @GetMapping("/records/{petId}")
    @Operation(summary = "Historial médico", description = "Obtiene todos los registros médicos de una mascota")
    public List<MedicalRecord> getRecords(
            @Parameter(description = "ID de la mascota") @PathVariable Long petId) {
        return medicalRecordRepository.findByPetId(petId);
    }

    @GetMapping("/vaccines/{petId}")
    @Operation(summary = "Vacunas", description = "Obtiene todas las vacunas de una mascota")
    public List<Vaccine> getVaccines(
            @Parameter(description = "ID de la mascota") @PathVariable Long petId) {
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
