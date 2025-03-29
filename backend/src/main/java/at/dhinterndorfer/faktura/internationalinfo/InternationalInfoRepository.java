package at.dhinterndorfer.faktura.internationalinfo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface InternationalInfoRepository extends JpaRepository<InternationalInfo, Long> {
}