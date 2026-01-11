package com.nt.entity;
import java.io.Serializable;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name="product_detail")
public class Product implements Serializable {

    @Id
    @GeneratedValue(generator = "gen-1",strategy = GenerationType.SEQUENCE)
    @SequenceGenerator(name="gen-1",sequenceName="product_seq",initialValue=1000,allocationSize=1)
    private Long id;

    @NotBlank(message = "{prod.name.blank}")
    @Pattern(regexp = "^[A-Za-z ]+$", message = "{prod.name.invalid}")
    private String name;

    @NotBlank(message = "{prod.category.blank}")
    @Pattern(regexp = "^[A-Za-z ]+$", message = "{prod.category.invalid}")
    private String category;

    @Column(nullable = false)
    @DecimalMin(value = "1.0", message = "{prod.price.min}")
    private Double price;

    @Column(nullable = false)
    @Min(value = 1, message = "{prod.quantity.min}")
    private Integer quantity;


}
