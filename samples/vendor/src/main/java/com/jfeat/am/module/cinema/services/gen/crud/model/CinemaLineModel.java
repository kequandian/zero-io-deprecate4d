package com.jfeat.am.module.cinema.services.gen.crud.model;

import com.jfeat.am.module.cinema.services.gen.persistence.model.Cinema;
import com.jfeat.am.module.cinema.services.gen.persistence.model.CinemaLine;

import java.util.List;

public class CinemaLineModel extends CinemaLine {
    List<Cinema> cinemas;

    public List<Cinema> getCinemas() {
        return cinemas;
    }

    public void setCinemas(List<Cinema> cinemas) {
        this.cinemas = cinemas;
    }
}
