# Optimization Model for Maximizing Production Profit with CO2 Emissions Consideration

## Project Overview

This project involves the development of a mathematical model to optimize the production strategy for a company manufacturing four products (P1, P2, P3, and P4). The objective is to maximize profit while considering constraints related to production stages, working hour availability, and environmental impact. The project addresses three main questions:

1. **Optimal Production Plan**: Developing a model to determine the number of units for each product to maximize profit and manage the reallocation of working hours between production stages.
2. **Carbon Emission Management**: Adjusting the initial model to assess if the company can maintain the maximum profit while reducing carbon emissions.
3. **Regulatory Compliance**: Modifying the strategy to comply with European environmental regulations limiting CO2 emissions to 4500 ppm per week.

## Problem Description

The company produces four products with the following profit margins and maximum demand:

- **P1**: Profit of €12/unit, maximum demand of 50 units
- **P2**: Profit of €25.5/unit, maximum demand of 60 units
- **P3**: Profit of €13/unit, maximum demand of 85 units
- **P4**: Profit of €20/unit, maximum demand of 75 units

### Production Stages and Working Hours

The production process is divided into three stages (A, B, and C). Each product requires a specific number of working hours at each stage:

| Stage | P1 (hours) | P2 (hours) | P3 (hours) | P4 (hours) |
|-------|------------|------------|------------|------------|
| A     | 2          | 2          | 3          | 1          |
| B     | 2          | 4          | 3          | 2          |
| C     | 3          | 6          | 1          | 5          |

The weekly available working hours for each stage are:

- **Stage A**: 160 hours
- **Stage B**: 200 hours
- **Stage C**: 80 hours

### Working Hour Reallocation

- Up to 20% of working hours from Stage B can be transferred to Stage A.
- Up to 30% of working hours from Stage C can be transferred to Stage A.

### Production Restrictions

- The quantity of P1 must be at least 90% of the quantity of P2.
- The quantity of P1 must not exceed 115% of the quantity of P4.

### Environmental Impact

CO2 emissions per unit for each product are:

- **P1**: 32 ppm
- **P2**: 82 ppm
- **P3**: 91 ppm
- **P4**: 70 ppm

## Objectives

1. **Develop an optimization model** in Matlab to determine the production strategy that maximizes profit and reallocates working hours effectively.
2. **Adjust the model** to include constraints for reducing CO2 emissions while maintaining the maximum profit.
3. **Identify a new production strategy** that meets environmental regulations limiting weekly emissions to 4500 ppm.

## Implementation in MATLAB

The model is implemented using MATLAB with the Gurobi solver for high-performance optimization. Gurobi's capabilities allow for efficiently solving large-scale linear programming problems, ensuring that the production plan is optimized for cost-effectiveness.

### Decision Variables

- **x1, x2, x3, x4**: Number of units produced for P1, P2, P3, and P4 respectively.
- **tB_A, tC_A**: Hours reallocated from Stage B and Stage C to Stage A.

### Objective Function

- **Maximize total profit**: \( z = 12x1 + 25.5x2 + 13x3 + 20x4 \)

### Constraints

1. **Production capacity** at each stage with potential reallocation
2. **Reallocation limits**
3. **Production ratios**
4. **Maximum demand**
5. **CO2 emissions constraint (for regulatory compliance)**

## Outcomes

The project successfully develops an optimization model to help the company maximize profit while meeting operational and environmental constraints. Adjustments to the model demonstrate the impact of CO2 emissions and guide the company to adopt strategies that comply with environmental regulations without compromising profitability.

## Future Enhancements

- Implement dynamic allocation models that consider fluctuating weekly demand.
- Integrate real-time data inputs for adaptive optimization.
- Extend the model to include additional environmental metrics (e.g., energy consumption).

## Conclusion

This project serves as a comprehensive framework for balancing production optimization with environmental sustainability. It provides insights for decision-makers to align with profitability goals and comply with stringent environmental standards.
