package at.dhinterndorfer.faktura.prepaidtax;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PrepaidTaxRepository extends JpaRepository<PrepaidTax, Long> {
}