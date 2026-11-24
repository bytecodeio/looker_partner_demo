# Bytecode Looker Partner Demo

A LookML reference project for demonstrating **eCommerce analytics with Looker and Google BigQuery**. It combines a reusable semantic model, interactive dashboards, and advanced analysis examples—including customer segmentation with BigQuery ML—to illustrate how business users can explore sales, customers, products, web activity, and fulfillment through consistent metrics.

This repository is intended as a **demo and learning resource**, not a turnkey production deployment. Some functionality depends on specific BigQuery datasets, pre-existing ML models, and external integrations.

## What you can demonstrate

| Business area | Example capabilities |
| --- | --- |
| Sales and revenue | Order trends, sales, average order value, first purchases, returns, gross margin, and year-over-year comparisons |
| Customer intelligence | Customer profiles, lifetime value indicators, repeat orders, purchase journeys, and retention cohorts |
| Brand and product analytics | Brand performance, correlated products, market-basket affinity, and item/brand share of wallet |
| Web and conversion analytics | Events, sessions, traffic sources, bounce rates, conversion funnels, and engagement |
| Inventory and operations | Inventory aging, historical stock snapshots, trailing sales, shipment status, and fulfillment delays |
| Advanced analytics | K-means customer segmentation in BigQuery ML, centroid and model-evaluation reporting, and segment analysis |
| LookML development patterns | Joined Explores, derived tables, datagroup caching, access filters, parameters, query definitions, and localization |

## Dashboards

The `dashboards/` directory contains ten LookML dashboards:

| Dashboard | Purpose |
| --- | --- |
| **Business Pulse** | Executive overview of sales, first-time purchasers, order activity, website conversion, retention, and customer behavior |
| **Brand Lookup** | Brand-level traffic, sales, customers, top products, correlated items, and share-of-wallet analysis |
| **Customer Lookup** | Customer details, order history, returns, favorite categories, and location |
| **Web Analytics Overview** | Visitors, session activity, bounce rates, conversion funnels, browsers, and site events |
| **Cohort Analysis Overview** | Cohort-oriented customer, product, brand, and sales performance reporting |
| **Shipping Logistics & Operations Overview** | Processing/shipping statuses, delayed orders, shipping geography, fulfillment timing, and inventory aging |
| **Cluster Analysis Overview** | Customer spending patterns, cluster sizes, behavior, and demographic comparisons |
| **Training Evaluation Overview** | BigQuery ML clustering training iterations, loss, features, and evaluation metrics |
| **Similar Audience Optimizer** | Brand and customer audience comparisons using traffic, conversion, purchasing, affinity, and demographics |
| **E-Commerce Discount Portal** | Inventory and discount reporting, including a tile labeled as a writeback example; external writeback operation is not established by the dashboard definition alone |

Dashboard files are version-controlled LookML definitions. They are not exports of the underlying BigQuery data.

## Semantic model and Explores

The primary model is [`models/thelook_partner.model.lkml`](models/thelook_partner.model.lkml). Its Looker model name is **`thelook_partner`**, and its configured connection is **`looker_partner_demo`**.

It includes these principal business-facing Explores:

| Explore label | LookML Explore | Focus |
| --- | --- | --- |
| (1) Orders, Items and Users | `order_items` | Sales, products, users, inventory, returns, and discounts |
| (2) Web Event Data | `events` | Event-level website behavior |
| (3) Web Session Data | `sessions` | Session-level website behavior and engagement |
| (4) Affinity Analysis | `affinity` | Products purchased together or by the same users |
| (5) Share of Wallet Analysis | `orders_with_share_of_wallet_application` | Brand and item contribution to total sales |
| (6) Customer Journey Mapping | `journey_mapping` | Repeat purchasing and subsequent-order relationships |
| (7) Historical Stock Snapshot Analysis | `inventory_snapshot` | Historical stock and trailing sales coverage |
| (8) Cohort Analysis | `ecomm_predict` | BigQuery ML customer cluster assignments, joined to eCommerce activity |

Additional technical and demonstration Explores support model evaluation, training inspection, dynamic metrics, and a hidden “Kittens” sample.

### Notable modeling patterns

- **Centralized business logic:** measures and dimensions are defined in Views and reused across dashboards and Explores.
- **Reusable joins:** customer, order, product, inventory, and behavior datasets are modeled together with declared join relationships.
- **Derived tables:** order facts, customer facts, affinity metrics, session summaries, inventory snapshots, and BQML feature sets are derived from underlying data.
- **Persistence:** the `ecommerce_etl` datagroup controls caching and persistence in parts of the project.
- **Access filtering:** the `order_items` Explore uses the `distribution_centers` user attribute to filter access by inventory distribution center.
- **Self-service flexibility:** filters and parameters support comparative metrics, cohort selection, and changing analytical perspectives.
- **Localization:** translation files exist for English, French, Japanese, Korean, Portuguese, and Simplified Chinese.

## BigQuery ML customer segmentation

The project demonstrates customer grouping using **BigQuery ML K-means clustering**:

1. Create customer-level features from product purchases, order behavior, and website events.
2. Define a K-means model example and use `ML.PREDICT` to associate customers with clusters.
3. Inspect model results with `ML.EVALUATE`, `ML.TRAINING_INFO`, `ML.FEATURE_INFO`, and `ML.CENTROIDS`.
4. Compare customer clusters through Looker Explores and dashboards.

See [`views/ecomm_bqml.view.lkml`](views/ecomm_bqml.view.lkml), [`views/ecomm_bqml_eval.view.lkml`](views/ecomm_bqml_eval.view.lkml), [`dashboards/cluster_analysis.dashboard.lookml`](dashboards/cluster_analysis.dashboard.lookml), and [`dashboards/training_eval.dashboard.lookml`](dashboards/training_eval.dashboard.lookml).

**Important:** The SQL references models such as `looker-private-demo.ecomm.kmeans_model5` and several models with other cluster counts. The repository does not package those trained model objects, and their existence and access must be confirmed before these examples can run.

## Repository structure

```text
.
├── README.md                 # Project overview and setup notes
├── manifest.lkml             # LookML project and localization settings
├── lkmlstyle.yaml            # LookML style/lint configuration
├── models/
│   └── thelook_partner.model.lkml
├── views/                    # Base views, derived tables, BQML, data tools
│   └── derived_views/        # Additional derived-table examples
├── explores/                 # Standalone Explore example(s)
├── queries/                  # Named query examples/refinements
├── dashboards/               # 10 LookML dashboard definitions
└── locale/                   # 6 localization JSON files
```

### Where to start reading the code

- [`models/thelook_partner.model.lkml`](models/thelook_partner.model.lkml): Explore definitions, joins, access filtering, and project-wide persistence.
- [`views/01_order_items.view.lkml`](views/01_order_items.view.lkml): order measures, dates, fulfillment metrics, and revenue logic.
- [`views/02_users.view.lkml`](views/02_users.view.lkml): customer attributes and geographic/demographic dimensions.
- [`views/51_events.view.lkml`](views/51_events.view.lkml) and [`views/52_sessions.view.lkml`](views/52_sessions.view.lkml): website events and session behavior.
- [`views/22_affinity.view.lkml`](views/22_affinity.view.lkml) and [`views/23_share_of_wallet.view.lkml`](views/23_share_of_wallet.view.lkml): advanced product and brand comparisons.
- [`views/97_web_analytics_data_tool.view.lkml`](views/97_web_analytics_data_tool.view.lkml) and [`views/98_cohort_data_tool.view.lkml`](views/98_cohort_data_tool.view.lkml): parameter-driven analytical experiences.
- [`queries/queries_for_order_items.view.lkml`](queries/queries_for_order_items.view.lkml): reusable high-value geography, year-over-year, shipment, aging, and delay query examples.

## Requirements

Before deploying this project to another environment, you will need:

1. Access to a Looker instance with LookML project-development permissions.
2. A Looker database connection to **Google BigQuery**, configured for the datasets used by this project.
3. Access to the required eCommerce tables, including orders/order items, users, products, inventory items, distribution centers, events, and any optional discounts data.
4. Permission to execute BigQuery queries and, where applicable, to create and use persistent derived tables and BigQuery ML models.
5. A Looker user attribute named `distribution_centers` configured appropriately for access filtering, or a deliberate modification to that access filter.
6. Any external services used by optional Looker actions or links, if you want those demonstrations to work.

### Environment-specific configuration

**Do not assume that cloning this repository makes it immediately runnable.** It contains references to more than one BigQuery project/dataset, including `looker-private-demo.ecomm` and `looker-partners.thelook`, as well as a connection named `looker_partner_demo`.

Before deploying elsewhere:

- Create or select the correct BigQuery connection in Looker, then update `connection` in the model if needed.
- Audit all `sql_table_name` references and hard-coded SQL table/model identifiers, including those inside derived tables.
- Make the corresponding data and BigQuery ML models available, or adjust/remove features that depend on them.
- Configure permissions, PDT-related requirements, and the `distribution_centers` user attribute.
- Validate all LookML files and confirm dashboard tiles run against the target environment.
- Review any sample actions, hyperlinks, writeback references, or external service URLs before enabling them.

## Getting started

1. Clone or fork the repository:

   ```bash
   git clone https://github.com/bytecodeio/looker_partner_demo.git
   ```

2. In your Looker instance, create or open a LookML project and connect it to the Git repository or your fork.
3. Configure the BigQuery connection and adapt environment-specific table references in the model and views.
4. Set up required permissions and user attributes; provision any optional BigQuery ML dependencies.
5. Validate the project in Looker Development Mode and resolve errors before deployment.
6. Start with **Business Pulse**, **Brand Lookup**, or **Web Analytics Overview** for core eCommerce demos; move to **Cluster Analysis Overview** and **Training Evaluation Overview** after verifying the BigQuery ML setup.

These are general deployment steps; they have not been tested against a fresh Looker/BigQuery environment for this repository.

## Suggested demo walkthrough

A useful progression for showing the breadth of the project:

1. **Business overview:** open *Business Pulse* for executive KPIs, sales trends, and customer behavior.
2. **Self-service exploration:** open *Orders, Items and Users* to illustrate reusable measures, filters, joins, and drilling into transactional detail.
3. **Digital journey:** use *Web Analytics Overview* and the event/session Explores to examine how visitors browse and convert.
4. **Customer and brand intelligence:** use *Brand Lookup*, *Customer Lookup*, and the affinity/share-of-wallet features.
5. **Operations:** show inventory aging, shipment bottlenecks, and stock coverage in *Shipping Logistics & Operations Overview*.
6. **Advanced analytics:** explain BigQuery ML K-means segmentation and review clusters, customer behavior, and model evaluation in Looker.

## Demo-only examples and known limitations

- **Sample dynamic calculation:** `explores/multiple_opperations.lkml` and `views/derived_views/multiple_opperations.view.lkml` demonstrate parameter selection, but all four operations currently generate addition (`+`) SQL. This example needs correction before it can demonstrate subtraction, multiplication, and division accurately.
- **External actions and links:** some view definitions include hard-coded dashboard URLs or external application endpoints. Treat them as environment-specific demonstration artifacts, not guaranteed working integrations. Review authentication and remove placeholder parameters before reuse.
- **BigQuery ML:** model references are external to this repository; deployment requires access to the trained models and feature data.
- **Discount/writeback demo:** the discount portal provides a dashboard example, but do not assume an end-to-end writeback workflow is supplied solely because a tile has “Writeback” in its title.
- **Dataset consistency:** tables and SQL are not fully parameterized; the source datasets mix `looker-private-demo.ecomm` with `looker-partners.thelook`. Repoint and validate them for your target environment.
- **Validation:** this README is based on source inspection. Execution, dashboard rendering, data freshness, and end-to-end integration behavior have not been verified in a running Looker instance.

## Contributing and reuse

This repository is a collection of demonstration patterns. When adapting it, keep business logic reusable in Views, clearly document external dependencies, and test both LookML validation and query results. Consider moving environment-specific identifiers into a documented configuration strategy before using the project for broader distribution.

The repository currently has no license file; contact the maintainers to confirm reuse or redistribution terms beyond GitHub's default repository access.

---

**Maintained by Bytecode** · [Repository on GitHub](https://github.com/bytecodeio/looker_partner_demo)
