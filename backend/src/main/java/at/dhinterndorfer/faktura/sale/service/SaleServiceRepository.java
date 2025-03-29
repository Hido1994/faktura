package at.dhinterndorfer.faktura.sale.service;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SaleServiceRepository extends JpaRepository<SaleService, Long> {
}