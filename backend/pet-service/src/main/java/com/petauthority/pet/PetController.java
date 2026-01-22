package com.petauthority.pet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import io.swagger.v3.oas.annotations.responses.ApiResponse;

import java.util.List;

@RestController
@RequestMapping("/pets")
@CrossOrigin(origins = "*")
@Tag(name = "Pets", description = "API para gestión de mascotas")
public class PetController {

    @Autowired
    private PetRepository petRepository;

    @PostMapping
    @Operation(summary = "Crear mascota", description = "Registra una nueva mascota en el sistema")
    @ApiResponse(responseCode = "200", description = "Mascota creada exitosamente")
    public Pet createPet(@RequestBody Pet pet) {
        return petRepository.save(pet);
    }

    @GetMapping
    @Operation(summary = "Listar mascotas", description = "Obtiene todas las mascotas registradas")
    public List<Pet> getAllPets() {
        return petRepository.findAll();
    }

    @GetMapping("/{id}")
    @Operation(summary = "Obtener mascota por ID", description = "Busca una mascota específica por su ID")
    @ApiResponse(responseCode = "200", description = "Mascota encontrada")
    @ApiResponse(responseCode = "404", description = "Mascota no encontrada")
    public ResponseEntity<Pet> getPetById(
            @Parameter(description = "ID de la mascota") @PathVariable Long id) {
        return petRepository.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @GetMapping("/owner/{ownerId}")
    @Operation(summary = "Mascotas por dueño", description = "Obtiene todas las mascotas de un dueño específico")
    public List<Pet> getPetsByOwner(
            @Parameter(description = "ID del dueño") @PathVariable Long ownerId) {
        return petRepository.findByOwnerId(ownerId);
    }
}
