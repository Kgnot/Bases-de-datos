package udistrital.module.bd.controller.user;


import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import udistrital.module.bd._PROFILE.Perfil;
import udistrital.module.bd.annotation.RequiredProfile;
import udistrital.module.bd.dto.entities.MensajeDTO;
import udistrital.module.bd.service.mensajeUsuario.MensajeUsuarioService;

import java.sql.Date;
import java.util.List;

@RestController
@RequestMapping("/mensaje_usuario")
@RequiredArgsConstructor
public class MensajeUsuarioController {

    private final MensajeUsuarioService service;
    private final Perfil perfil;

    @GetMapping
    @RequiredProfile
    public List<MensajeDTO> msmByUsuario(
            @RequestParam(required = false) String carpeta,
            @RequestParam(required = false) String asunto,
            @RequestParam(required = false) String categoria,
            @RequestParam(required = false) Date fechaDesde,
            @RequestParam(required = false) Date fechaHasta) {
        return service.buscarMensajes(perfil.getUsuario(),
                carpeta, asunto, categoria, fechaDesde, fechaHasta);
    }

    @PostMapping
    @RequiredProfile
    public ResponseEntity<?> enviarMensaje(@RequestBody MensajeDTO mensajeDto)
    {
        var mensaje = service.enviarMensaje(mensajeDto);
        return ResponseEntity.ok().body("Mensaje enviado"+mensaje);
    }

}
